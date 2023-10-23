using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Pointer : MonoBehaviour
{
    public Transform cameraTransform;
    public float Size = 0.01f;
    void LateUpdate()
    {
        float scale = Vector3.Distance(transform.position, cameraTransform.position);
        transform.localScale = Vector3.one * scale * Size;
    }
}
