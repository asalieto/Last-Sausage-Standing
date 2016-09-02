using UnityEngine;
using System.Collections;
using XInputDotNetPure;
using System.Collections.Generic;

public class TestControl : MonoBehaviour
{

	public PlayerIndex Gamepad;
	private GamePadState state;
	private GamePadState laststate;
	public Vector2 ForceMultiplier;
	public float MaxSpeed;
	bool alive;
	Rigidbody2D[] rigidbodys;
	int topControlIndex;
	bool onGround;
	bool updateBodys;
	List<Rigidbody2D> brokenParts;

	// Use this for initialization
	void Start ()
	{
		state = GamePad.GetState (Gamepad);
		rigidbodys = this.GetComponentsInChildren<Rigidbody2D> ();
		topControlIndex = rigidbodys.Length - 1;
		onGround = false;
		updateBodys = false;
		alive = true;
		brokenParts = new List<Rigidbody2D> ();
	}
	
	// Update is called once per frame
	void Update ()
	{
			if(updateBodys){
				rigidbodys = this.GetComponentsInChildren<Rigidbody2D> ();
				updateBodys=false;
			}
			if(brokenParts.Count>0){
				for(int i=brokenParts.Count-1;i>=0;i--){
				for(int j=i-1;j>=0;j--){
						bool b=CutByPiece(brokenParts[i],brokenParts[j]);
						if(b){
							brokenParts.RemoveAt(i);
							brokenParts.RemoveAt(j);
						}
					}
				}
				for(int i=brokenParts.Count-1;i>=0;i--){
					DestroyByPiece(brokenParts[i]);
				}
		}
		if (alive) {
			laststate = state;
			state = GamePad.GetState (Gamepad);
			GroundCollision gc = rigidbodys [1].transform.GetComponent<GroundCollision> ();
			if(gc){
				onGround=gc.Ground;
			}
			if (state.IsConnected) {
				for (int i=0; i<rigidbodys.Length; i++) {
					Rigidbody2D rb = rigidbodys [i];
					if (rb) {
						if (i == 1) {
							Vector2 f = new Vector2 (state.ThumbSticks.Left.X * ForceMultiplier.x, state.ThumbSticks.Left.Y * ForceMultiplier.y);
							if (!onGround && f.y > 0)
								f.y = 0;
							rb.AddForce (f);
						}
						if (i == topControlIndex) {
							Vector2 f = new Vector2 (state.ThumbSticks.Right.X * ForceMultiplier.x, state.ThumbSticks.Right.Y * ForceMultiplier.y);
							if (!onGround && f.y > 0)
								f.y = 0;
							rb.AddForce (f);
						}
						if (rb.velocity.x > MaxSpeed) {
							rb.velocity = new Vector2 (MaxSpeed, rb.velocity.y);
						}
						if (rb.velocity.x < -MaxSpeed) {
							rb.velocity = new Vector2 (-MaxSpeed, rb.velocity.y);
						}
					}
				}
			}
		}
	}

	public void AddBroken(Rigidbody2D b){
		brokenParts.Add (b);
	}
	
	bool CutByPiece (Rigidbody2D body, Rigidbody2D body2){
		int p1 = 0, p2 = 0;
		for (int i=0; i<rigidbodys.Length; i++) {
			if(rigidbodys[i]==body){
				p1=i;
			}
			if(rigidbodys[i]==body2){
				p2=i;
			}
		}
		if (p1 - p2 == 1) {
			return CutByPiece (p2);
		} else if (p2 - p1 == 1) {
			return CutByPiece (p1);
		} else {
			return false;
		}
	}

	bool CutByPiece (int p)
	{
		//GameObject.Find ("cuchillo").GetComponent<AudioSource>().Play();

		if (p > 0 && p<rigidbodys.Length) {
			for (int i=p+1; i<rigidbodys.Length; i++) {
				SpringJoint2D[] sp = rigidbodys [i].transform.GetComponents<SpringJoint2D> ();
				if (sp.Length > 0) {
					for (int j=0; j<sp.Length; j++) {
						Destroy (sp [j]);
					}
				}
			}
				DistanceJoint2D dp = rigidbodys [p].transform.GetComponent<DistanceJoint2D> ();
				if (dp) {
					Destroy (dp);
				}
			DistanceJoint2D dp0 = rigidbodys [rigidbodys.Length - 1].transform.GetComponent<DistanceJoint2D> ();
			if (dp0) {
				Destroy (dp0);
			}
			topControlIndex = p;
			return true;
		}
		return false;
	}

	bool DestroyByPiece (Rigidbody2D body){
		int p1 = 0;
		for (int i=0; i<rigidbodys.Length; i++) {
			if(rigidbodys[i]==body){
				p1=i;
			}
		}
		return DestroyByPiece (p1);
	}
	
	bool DestroyByPiece (int p)
	{
		if (p > 0 && p<rigidbodys.Length) {
			for (int i=p+1; i<rigidbodys.Length; i++) {
				SpringJoint2D[] sp = rigidbodys [i].transform.GetComponents<SpringJoint2D> ();
				if (sp.Length > 0) {
					for (int j=0; j<sp.Length; j++) {
						Destroy (sp [j]);
					}
				}
			}
				DistanceJoint2D dp = rigidbodys [p - 1].transform.GetComponent<DistanceJoint2D> ();
				if (dp) {
					Destroy (dp);
				}
			DistanceJoint2D dp0 = rigidbodys [rigidbodys.Length - 1].transform.GetComponent<DistanceJoint2D> ();
			if (dp0) {
				Destroy (dp0);
			}
			if(rigidbodys[p].transform.childCount>0){
			Transform broken=rigidbodys[p].transform.GetChild(0);
			
			broken.parent=rigidbodys[p].transform.parent;
			broken.gameObject.SetActive(true);
			}
			Destroy (rigidbodys [p].gameObject);
			updateBodys=true;
			if (p == 1) {
				alive = false;
				Destroy (rigidbodys [0].gameObject);
			} else {
				topControlIndex = topControlIndex<(p - 1)?topControlIndex:(p - 1);
			}
			return true;
		}
		return false;
	}
}
