using UnityEngine;
using UnityEngine.AI;

public class ChaseAim : MonoBehaviour
{
    // Start is called before the first frame update
    public NavMeshAgent agent;
    private GameObject aimRef;
    void Start()
    {
        aimRef = GameObject.FindGameObjectWithTag("Aim");
        Debug.Log("Rabotaet1");
    }

    // Update is called once per frame
    void Update()
    {
        Debug.Log("Rabotaet2");
        agent.SetDestination(aimRef.transform.position);
    }
}
