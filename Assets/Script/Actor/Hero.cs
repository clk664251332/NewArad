using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Hero : Actor
{
    private HeroInputAbility m_HeroInputAbility;

    public override void Initialize()
    {
        base.Initialize();
        m_HeroInputAbility = new HeroInputAbility(m_AbilityManager, this);
    }
}
