using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using System;

public class Escena : MonoBehaviour {
	
	float tiempoRestante = 18;
	int   numRondas = 4;

	// Use this for initialization
	void Start () {
		//EstadoJuego.estadoJuego.numRonda = EstadoJuego.estadoJuego.numRonda / 2;
		Debug.Log ("Ronda: " + (EstadoJuego.estadoJuego.numRonda).ToString ());
	}
	
	// Update is called once per frame
	void Update () {


		if(tiempoRestante > 0){
			
			tiempoRestante -= Time.deltaTime;

			double decimalValue = Math.Ceiling(tiempoRestante);

			GameObject.Find ("Cuenta").GetComponent<Text> ().text = decimalValue.ToString();
		}
		else
		{
			if(EstadoJuego.estadoJuego.numRonda != numRondas-1){
				Application.LoadLevel("Transicion");
			}else{
				Destroy(gameObject);
				GameObject.Find ("MusicaJuego").GetComponent<AudioSource>().Stop();
				Application.LoadLevel("ScoreScreen");
			}
		}
	}
}
