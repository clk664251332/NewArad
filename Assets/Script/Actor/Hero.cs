using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Hero : Actor
{
    public override void AddAbility()
    {
        base.AddAbility();
        m_AbilityManager.AddAbility<HeroInputAbility>(this);
    }

    public override void Initialize()
    {
        base.Initialize();
    }
}
