using UnityEngine;
using System.Collections;

public class scriptCuchillo : MonoBehaviour {

	Animator animator;
	// Use this for initialization
	void Start () {

		animator = GetComponent<Animator> ();
		animator.SetTrigger ("atacando");
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
