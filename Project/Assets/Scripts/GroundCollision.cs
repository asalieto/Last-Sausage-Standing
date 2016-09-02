using UnityEngine;
using System.Collections;

public class GroundCollision : MonoBehaviour {
	bool onGround;
	// Use this for initialization
	void Start () {
		onGround = false;
	}

	public bool Ground{
		get{ return onGround;}
	}
	
	void OnCollisionEnter2D(Collision2D collision){
		if (collision.transform.tag == "Suelo") {
			onGround=true;
		}
	}
	
	void OnCollisionExit2D(Collision2D collision) {
		if (collision.transform.tag == "Suelo") {
			onGround=false;
		}
	}
}
