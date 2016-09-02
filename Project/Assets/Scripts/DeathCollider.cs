using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class DeathCollider : MonoBehaviour {

	void OnCollisionEnter2D(Collision2D collision){
		if (collision.transform.tag == "Player") {
			Rigidbody2D r=collision.transform.GetComponent<Rigidbody2D>();
			if(r){
				r.transform.parent.GetComponent<TestControl>().AddBroken(r);
			}
		}
	}
}
