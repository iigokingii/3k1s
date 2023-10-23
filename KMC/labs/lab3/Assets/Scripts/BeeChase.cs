using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BeeChase : MonoBehaviour
{
    // Start is called before the first frame update
    [Range(0,360)]
    public float angle = 30;
    public float radius = 6;
    private GameObject playerRef;

    public LayerMask targetMask;
    public LayerMask obstractionMask;

    public bool canSeePlayer;

    void Start()
    {
        playerRef = GameObject.FindGameObjectWithTag("Player");
        StartCoroutine(FovRoutine());
    }

    // Update is called once per frame
    void Update()
    {
        
    }
    private IEnumerator FovRoutine()
    {
        WaitForSeconds wait = new WaitForSeconds(0.2f);
        
        while (true)
        {
            yield return wait;
            FielOfViewCheck();
        }
    }
    private bool FielOfViewCheck()
    {
        Collider[] rangeChecks = Physics.OverlapSphere(transform.position, radius, targetMask);
        if (rangeChecks.Length != 0)
        {
            Transform target = rangeChecks[0].transform;
            Vector3 directionToTarget = (target.position - transform.position).normalized;
            if (Vector3.Angle(transform.forward, directionToTarget) < angle / 2)
            {
                float distanceToTarget = Vector3.Distance(transform.position, target.position);
                if (!Physics.Raycast(transform.position, directionToTarget, distanceToTarget, obstractionMask))
                {
                    canSeePlayer = true;
                    Debug.Log("Rabotaet");
                    transform.position = Vector3.MoveTowards(transform.position, playerRef.transform.position, 0.3f);
                }
                else
                    canSeePlayer = false;
            }
            else
            {
                canSeePlayer = false;
            }
        }
        else if (canSeePlayer)
            canSeePlayer = false;
        return canSeePlayer;
    }
    void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.tag == "Player")
        {
            Debug.Log("End Game");
            Destroy(collision.gameObject);
            UnityEditor.EditorApplication.isPlaying = false;
        }
    }
}
