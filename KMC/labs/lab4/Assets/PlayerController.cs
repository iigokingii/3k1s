using UnityEngine;
using UnityEngine.AI;


public class PlayerController : MonoBehaviour
{
    public Camera main;
    public Camera first;
    public NavMeshAgent agent;
    private bool checkMain = true;

    void Start()
    { 
        main.gameObject.SetActive(true);
        first.gameObject.SetActive(false);
    }

    // Update is called once per frame
    void Update()
    {
        Ray ray = new Ray();
        if (checkMain)
        {
            ray = main.ScreenPointToRay(Input.mousePosition);

        }
        else
        {
            ray = first.ScreenPointToRay(Input.mousePosition);
        }

        if (Input.GetMouseButtonDown(0))
        {
            RaycastHit hit;

            if (Physics.Raycast(ray, out hit, 100))
            {
                agent.destination = hit.point;
            }
        }

        if (Input.GetKeyDown(KeyCode.Space))
        {
            if (checkMain)
            {
                first.gameObject.SetActive(true);
                main.gameObject.SetActive(false);
                checkMain = false;
            }
            else
            {
                first.gameObject.SetActive(false);
                main.gameObject.SetActive(true);
                checkMain = true;
            }

        }

    }
}
