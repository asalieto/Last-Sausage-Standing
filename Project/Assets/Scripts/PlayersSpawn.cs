using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using XInputDotNetPure;

public class PlayersSpawn : MonoBehaviour {

	public List<Transform> spawnPoints;

	// Use this for initialization
	void Start () {
		for(int i=0;i<4;i++){
			if(EstadoJuego.estadoJuego.PlayerStates[i]){
				int s = Random.Range(0,spawnPoints.Count);
				int type=EstadoJuego.estadoJuego.PlayerTypes[i];
				type=type==0?Random.Range(1,5):type;
				GameObject player;
				switch(type){
				case 1: //
					player=Resources.Load("Salchichas") as GameObject;
					break;
				case 2: //
					player=Resources.Load("Morcillas") as GameObject;
					break;
				case 3: //
					player=Resources.Load("Choricitos") as GameObject;
					break;
				case 4: //
					player=Resources.Load("Blanca") as GameObject;
					break;
				default:
					player=new GameObject();
					break;
				}
				GameObject marker = Resources.Load("Player"+(i+1)) as GameObject;
				player.transform.position=spawnPoints[s].position;
				TestControl tc=player.GetComponent<TestControl>();
				if(tc){
					tc.Gamepad=(PlayerIndex)i;
				}
				player=Instantiate(player);
				marker=Instantiate(marker);
				marker.transform.parent=player.transform;
				marker.transform.localPosition=new Vector3(0,15,0);
				marker.transform.localScale=new Vector3(2,2,2);
				marker.transform.parent=player.transform.GetChild(0);
				spawnPoints.RemoveAt(s);
			}
		}
	}
}
