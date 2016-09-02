using UnityEngine;
using System.Collections;

public class Scroll : MonoBehaviour {
	
	public float velocidadL = 0f;
	public float velocidadD = 0f;
	private bool enMovimiento = false;
	private float tiempoInicio = 0f;
	
	// Use this for initialization
	void Start () {
		enMovimiento = true;
		tiempoInicio = Time.time;
	}
	
	void PersonajeHaMuerto(){
		enMovimiento = false;
	}
	
	void PersonajeEmpiezaACorrer(){
		enMovimiento = true;
		tiempoInicio = Time.time;
	}
	
	// Update is called once per frame
	void Update () {
		if(enMovimiento){
			GameObject.Find ("FondoLento").GetComponent<Renderer>().material.mainTextureOffset = new Vector2(((Time.time - tiempoInicio) * velocidadL) % 1, 0);
			GameObject.Find ("FondoDeprisa").GetComponent<Renderer>().material.mainTextureOffset = new Vector2(((Time.time - tiempoInicio) * velocidadD) % 1, 0);
		}
	}
}