using UnityEngine;
using System.Collections;

public class ScriptNuevaPartida : MonoBehaviour {
	
	public void nuevaPartida () {
		GameObject.Find ("Button_NuevaPartida").GetComponent<AudioSource>().Play();
		Invoke("CargarNuevaPartida", GameObject.Find ("Button_NuevaPartida").GetComponent<AudioSource>().clip.length);
	}	

	public void volverAlMenu () {
		GameObject.Find ("Button_VolverAlMenu").GetComponent<AudioSource>().Play();
		Invoke("CargarVolverAlMenu", GameObject.Find ("Button_VolverAlMenu").GetComponent<AudioSource>().clip.length);
	}

	public void creditos () {
		GameObject.Find ("Button_Creditos").GetComponent<AudioSource>().Play();
		Invoke("CargarCreditos", GameObject.Find ("Button_Creditos").GetComponent<AudioSource>().clip.length);
	}
	
	public void comoJugar () {
		GameObject.Find ("Button_ComoJugar").GetComponent<AudioSource>().Play();
		Invoke("CargarComoJugar", GameObject.Find ("Button_ComoJugar").GetComponent<AudioSource>().clip.length);
	}
	
	public void salir () {
		GameObject.Find ("Button_Salir").GetComponent<AudioSource>().Play();
		Invoke("CargarSalir", GameObject.Find ("Button_Salir").GetComponent<AudioSource>().clip.length);
	}
	
	void CargarNuevaPartida(){
		Application.LoadLevel("SeleccionJugadores");
	}
	
	void CargarVolverAlMenu(){
		Application.LoadLevel("MainMenu");
	}
	
	void CargarCreditos(){
		Application.LoadLevel("Creditos2");
	}
	
	void CargarComoJugar(){
		Application.LoadLevel ("ComoJugar");
	}

	void CargarSalir(){
		Application.Quit ();
	}
}
