using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerRay : MonoBehaviour
{
    // Start is called before the first frame update
    public Transform Pointer;
    Selectable currentSelectable;
    void Start()
    {
        
    }

    // Update is called once per frame
    void LateUpdate()
    {
        Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
        //Ray ray = new Ray(transform.position, transform.forward);
        Debug.DrawRay(transform.position, transform.forward * 100f, Color.yellow);
        RaycastHit hit;
        if(Physics.Raycast(ray,out hit))
        {
            Pointer.position = hit.point;
            Selectable selectable = hit.collider.gameObject.GetComponent<Selectable>();
            if (selectable)
            {
                if (currentSelectable && currentSelectable != selectable)
                {
                    currentSelectable.Deselect();
                }
                else
                {
                    currentSelectable = selectable;
                    selectable.Select();
                }
                
            }
            else
            {
                if (currentSelectable)
                {
                    currentSelectable.Deselect();
                    currentSelectable = null;
                }
            }
        }
        else
        {
            if (currentSelectable)
            {
                currentSelectable.Deselect();
                currentSelectable = null;
            }
        }   
    }
}
