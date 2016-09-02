using UnityEngine;
using System.Collections;
using XInputDotNetPure;

public class EstadoJuego : MonoBehaviour {
	
	public static EstadoJuego estadoJuego;

	public const int typeNum=5;

	private bool[]	numJugadores;
	private int[] typeJugadores;
	private int 	countJugadores;
	public int		numRonda;
	public string[] arrayNiveles;

	private bool pause;
	private int playerPause;

	public bool SetPlayer(int index, bool state, int type){
		if (index < 4) {
			countJugadores=0;
			numJugadores[index]=state;
			typeJugadores[index]=type%typeNum;
			for(int i=0;i<4;i++){
			countJugadores+=numJugadores[i]?1:0;
			}
			return true;
		}
		return false;
	}

	public int[] PlayerTypes{
		get{return typeJugadores;}
	}

	public bool[] PlayerStates{
		get{return numJugadores;}
	}

	public int PlayerCount{
		get{ return countJugadores;}
	}

	void Awake () {
		if(estadoJuego == null){
			estadoJuego = this;
			DontDestroyOnLoad (gameObject);
		}else if(estadoJuego != this){
			Destroy(gameObject);
		}
	}	

	public void init(){
		numJugadores = new bool[]{false, false, false, false};
		typeJugadores = new int[]{0,0,0,0};
		countJugadores = 0;
		arrayNiveles = new string[]{"","","",""};
		pause = false;
		numRonda = 0;
		playerPause = -1;
		string s = "";

		for (int i=0; i<3; i++) {
			
			switch (/*Random.Range (0, 2)*/i) {
			case 0:
				s = "cuchillo.unity";
				break;
			case 1:
				s = "kitchenaid.unity";
				break;
			case 2:
				s = "plato.unity.unity";
			break;
			}
			
			arrayNiveles[i] = s;
			
		}
		
		numRonda = 0;
	}

	// Use this for initialization
	void Start () {
		init ();
	}

	void CheckControllers(){
		for (int i=0; i<4; i++) {
			if(numJugadores[i]){
				if(!GamePad.GetState((PlayerIndex)i).IsConnected){
					pause=true;
					playerPause=i;
					break;
				}
			}
		}
	}

	void checkStart(){

	}

	// Update is called once per frame
	void Update () {
		
		pause=false;
		CheckControllers ();
		Time.timeScale = pause ? 0 : 1;
	}
}
