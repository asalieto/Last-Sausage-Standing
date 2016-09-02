using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using XInputDotNetPure;

public class DetectarJugadores : MonoBehaviour
{
	
	//bool playerIndexSet = false;
	public PlayerIndex Gamepad;
	private GamePadState[] state;
	private GamePadState[] laststate;
	public Text startText;
	private int[] types;
	private bool[] selecting;
	private Transform[] previews;

	private int selectionOffset=3;

	// Use this for initialization
	void Start ()
	{
		EstadoJuego.estadoJuego.init ();
		state = new GamePadState[4];
		laststate = new GamePadState[4];
		types=new int[]{0,0,0,0};
		previews = new Transform[4];
		selecting = new bool[]{false,false,false,false};
		previews [0] = GameObject.Find ("Preview1").transform;
		previews [1] = GameObject.Find ("Preview2").transform;
		previews [2] = GameObject.Find ("Preview3").transform;
		previews [3] = GameObject.Find ("Preview4").transform;
		for (int i = 0; i < 4; ++i) {
			startText.gameObject.SetActive (false);
			PlayerIndex testPlayerIndex = (PlayerIndex)i;
			GamePadState testState = GamePad.GetState (testPlayerIndex);
			if (testState.IsConnected) {

				int _aux = i + 1;

				GameObject.Find ("NombreP" + _aux.ToString () + "").GetComponent<Text> ().text = "A para unirte";
				//Debug.Log(string.Format("GamePad found {0}", testPlayerIndex));
				Gamepad = testPlayerIndex;
				//playerIndexSet = true;
			}
		}
	}
	
	// Update is called once per frame
	void Update ()
	{
		for (int i = 0; i < 4; ++i) {
			PlayerIndex testPlayerIndex = (PlayerIndex)i;
			laststate [i] = state [i];
			state [i] = GamePad.GetState (testPlayerIndex);
			//GamePadState testState = GamePad.GetState(testPlayerIndex);
			if (state [i].IsConnected) {
				int _aux = i + 1;
				if(!EstadoJuego.estadoJuego.PlayerStates[i]){
				}

				if (!selecting[i] && !EstadoJuego.estadoJuego.PlayerStates[i]) {
					GameObject.Find ("NombreP" + _aux.ToString () + "").GetComponent<Text> ().text = "A para unirte";
					Gamepad = testPlayerIndex;
					previews[i].GetChild(0).gameObject.SetActive(false);
					previews[i].GetChild(1).gameObject.SetActive(true);
					//playerIndexSet = true;
				}

				if (state [i].Buttons.A == ButtonState.Pressed && laststate [i].Buttons.A == ButtonState.Released && !selecting[i] && !EstadoJuego.estadoJuego.PlayerStates[i]) {
					selecting[i]=true;
					GameObject.Find ("ScriptDetectarJ").GetComponent<AudioSource> ().Play ();
					//Debug.Log("numero :"+i);
					GameObject.Find ("NombreP" + _aux.ToString () + "").GetComponent<Text> ().text = "Seleccionando";
					//Debug.Log(EstadoJuego.estadoJuego.PlayerCount);

					previews[i].GetChild(1).gameObject.SetActive(false);
					previews[i].GetChild(types[i]+selectionOffset).gameObject.SetActive(true);
					/*
					Debug.Log (EstadoJuego.estadoJuego.numJugadores[0].ToString());
					Debug.Log (EstadoJuego.estadoJuego.numJugadores[1].ToString());
					Debug.Log (EstadoJuego.estadoJuego.numJugadores[2].ToString());
					Debug.Log (EstadoJuego.estadoJuego.numJugadores[3].ToString());
					*/
				}

				else if (state [i].Buttons.A == ButtonState.Pressed && laststate [i].Buttons.A == ButtonState.Released && selecting[i] && !EstadoJuego.estadoJuego.PlayerStates[i]) {
					selecting[i]=false;
					GameObject.Find ("ScriptDetectarJ").GetComponent<AudioSource> ().Play ();
					//Debug.Log("numero :"+i);
					GameObject.Find ("NombreP" + _aux.ToString () + "").GetComponent<Text> ().text = "READY";
					//Debug.Log(EstadoJuego.estadoJuego.PlayerCount);
					
					EstadoJuego.estadoJuego.SetPlayer (i, true,types[i]);
					if (EstadoJuego.estadoJuego.PlayerCount > 1) {
						startText.gameObject.SetActive (true);
					}
					previews[i].GetChild(2).gameObject.SetActive(true);
				}

				 if (state [i].Buttons.B == ButtonState.Pressed && laststate [i].Buttons.B == ButtonState.Released && EstadoJuego.estadoJuego.PlayerStates[i]) {
					selecting[i]=true;
					GameObject.Find ("ScriptDetectarJ").GetComponent<AudioSource> ().Play ();
					//Debug.Log("numero :"+i);
					GameObject.Find ("NombreP" + _aux.ToString () + "").GetComponent<Text> ().text = "Seleccionando";
					EstadoJuego.estadoJuego.SetPlayer (i, false,0);
					previews[i].GetChild(2).gameObject.SetActive(false);
					
					if (EstadoJuego.estadoJuego.PlayerCount < 2) {
						startText.gameObject.SetActive (false);
					}
				}

				else if (state [i].Buttons.B == ButtonState.Pressed && laststate [i].Buttons.B == ButtonState.Released && selecting[i] && !EstadoJuego.estadoJuego.PlayerStates[i]) {
					GameObject.Find ("ScriptDetectarJ").GetComponent<AudioSource> ().Play ();

					GameObject.Find ("NombreP" + _aux.ToString () + "").GetComponent<Text> ().text = "A para unirte";
					selecting[i]=false;

					for(int c=selectionOffset;c<EstadoJuego.typeNum+selectionOffset;c++){
						previews[i].GetChild(c).gameObject.SetActive(false);
					}
					previews[i].GetChild(1).gameObject.SetActive(true);
					/*
					Debug.Log (EstadoJuego.estadoJuego.numJugadores[0].ToString());
					Debug.Log (EstadoJuego.estadoJuego.numJugadores[1].ToString());
					Debug.Log (EstadoJuego.estadoJuego.numJugadores[2].ToString());
					Debug.Log (EstadoJuego.estadoJuego.numJugadores[3].ToString());
					*/
				}
				
				if(state [i].DPad.Left == ButtonState.Pressed && laststate [i].DPad.Left == ButtonState.Released && selecting[i]){
					
					types[i]--;
				types[i]=types[i]<0?EstadoJuego.typeNum+types[i]:types[i];
					for(int c=selectionOffset;c<EstadoJuego.typeNum+selectionOffset;c++){
						previews[i].GetChild(c).gameObject.SetActive(false);
					}
					previews[i].GetChild(types[i]+selectionOffset).gameObject.SetActive(true);
				}
				
				if(state [i].DPad.Right == ButtonState.Pressed && laststate [i].DPad.Right == ButtonState.Released && selecting[i]){
					types[i]=(types[i]+1)%EstadoJuego.typeNum;
					for(int c=selectionOffset;c<EstadoJuego.typeNum+selectionOffset;c++){
						previews[i].GetChild(c).gameObject.SetActive(false);
					}
					previews[i].GetChild(types[i]+selectionOffset).gameObject.SetActive(true);
				}

				if (state [i].Buttons.Start == ButtonState.Pressed && laststate [i].Buttons.Start == ButtonState.Released && EstadoJuego.estadoJuego.PlayerStates [i] && EstadoJuego.estadoJuego.PlayerCount > 1) {
					GameObject.Find ("ScriptDetectarJ").GetComponent<AudioSource> ().Play ();
					Invoke ("CargarRondas", GameObject.Find ("ScriptDetectarJ").GetComponent<AudioSource> ().clip.length);

				}
			} else {
				int _aux = i + 1;
				GameObject.Find ("NombreP" + _aux.ToString () + "").GetComponent<Text> ().text = "Desconectado";
				selecting[i]=false;
				for(int c=0;c<EstadoJuego.typeNum+selectionOffset;c++){
					previews[i].GetChild(c).gameObject.SetActive(false);
				}
				previews[i].GetChild(0).gameObject.SetActive(true);
				EstadoJuego.estadoJuego.SetPlayer (i, false,0);
			}
		}
	}

	void CargarRondas ()
	{
		/* Generar los niveles que vamos a utilizar y meterlas en el tipo de objeto state*/

		Destroy (ScriptMusica.scriptMusica.gameObject);
		Application.LoadLevel ("Transicion");
	}

}
