using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Monster : Actor
{
    public override void AddAbility()
    {
        base.AddAbility();
        m_AbilityManager.AddAbility<AIAbility>(this);
        m_AbilityManager.AddAbility<TalkAbility>(this);
    }

    public override void Initialize()
    {
        base.Initialize();
    }

    public override void Release()
    {
        base.Release();
    }

    public override void Update()
    {
        base.Update();
    }
}
