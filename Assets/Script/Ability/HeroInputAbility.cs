using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HeroInputAbility : BaseAbility
{
    public override void Initialize()
    {
        base.Initialize();
    }

    public override void Update()
    {
        base.Update();
        if ((m_owner is Hero) == false)
            return;

        if (Input.GetKeyDown(KeyCode.A))
        {
            Debug.Log("Left");
        }
    }
}
