using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class color : MonoBehaviour
{
    private Renderer sphereRenderer;

    private void Start()
    {

        sphereRenderer = GetComponent<Renderer>();
    }

    private void Update()
    {

        if (Input.GetKeyDown(KeyCode.Space))
        {

            Color randomColor = new Color(Random.value, Random.value, Random.value);


            sphereRenderer.material.color = randomColor;
        }
    }
}
