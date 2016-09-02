using UnityEngine;
using System.Collections;

public class tostadora : MonoBehaviour {

	public float fuerzaTostada1 = 1000;
	public float fuerzaTostada2 = 1000;
	public float fuerzaTostada3 = 1000;

	public float espera1 = 1;
	public float espera2 = 5;
	public float espera3 = 10;
	// Use this for initialization
	void Start () {

		StartCoroutine(lanzarTostada(this.transform.GetChild (1).GetComponent<Rigidbody2D>(), espera1, fuerzaTostada1));
		StartCoroutine(lanzarTostada(this.transform.GetChild (2).GetComponent<Rigidbody2D>(), espera2, fuerzaTostada2));
		StartCoroutine(lanzarTostada(this.transform.GetChild (3).GetComponent<Rigidbody2D>(), espera3, fuerzaTostada3));
	
	}

	IEnumerator lanzarTostada(Rigidbody2D rb, float s, float fuerza){
		float t = s;

		Debug.Log ("valor: " + s);

		yield return new WaitForSeconds(t);
		rb.AddForce (new Vector3 (fuerza, 100, 0));

	}
	


}
