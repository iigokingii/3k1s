using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GenerateBees : MonoBehaviour
{
    // Start is called before the first frame update
    public GameObject prefab;
    void Start()
    {
        prefab.tag = "Bee";

        for (int i = 0; i < 6; i++)
        {
            Vector3 position = new Vector3(Random.Range(-13.0f,13.0f), 2.5f, Random.Range(-13.0f, 13.0f));
            Quaternion rotation = Quaternion.Euler(0, Random.Range(0, 360), 0);
            Instantiate(prefab, position, rotation);
        }
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
