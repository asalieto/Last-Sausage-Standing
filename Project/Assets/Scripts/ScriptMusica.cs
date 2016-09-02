using UnityEngine;
using System.Collections;

public class ScriptMusica : MonoBehaviour {
	
	public static ScriptMusica scriptMusica;

	void Awake () {
		if(scriptMusica == null){

			scriptMusica = this;
			DontDestroyOnLoad (gameObject);

		}else if(scriptMusica != this){
			Destroy(gameObject);
		}
	}	
	
	// Use this for initialization
	void Start () {

	}
	
	// Update is called once per frame
	void Update () {
		
	}

	void autodestruir(){
		Destroy (this);
	}
}
