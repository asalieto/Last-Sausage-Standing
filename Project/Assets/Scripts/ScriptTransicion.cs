using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using System;

public class ScriptTransicion : MonoBehaviour {
	
	float tiempoRestante = 3;

	// Use this for initialization
	void Start () {
	
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
			//Debug.Log ("Voy a subir el numero de ronda de " + EstadoJuego.estadoJuego.numRonda + " a " + (EstadoJuego.estadoJuego.numRonda+1).ToString());
			EstadoJuego.estadoJuego.numRonda++;
			if(EstadoJuego.estadoJuego.numRonda != 4){
				Application.LoadLevel(EstadoJuego.estadoJuego.arrayNiveles[(EstadoJuego.estadoJuego.numRonda-1)]);
			}
		}
	}

}
