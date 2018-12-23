using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Actor : Entity
{
    protected AbilityManager m_AbilityManager;
    private AnimationAbility m_AnimationAbility;

    public override void Initialize()
    {
        base.Initialize();
        m_AbilityManager = new AbilityManager();
        m_AbilityManager.AddAbility<AnimationAbility>(this);
    }

    public override void Update()
    {
        base.Update();
        m_AbilityManager.Update();
    }

    public override void Release()
    {
        base.Release();
        m_AbilityManager.Release();
    }
}
