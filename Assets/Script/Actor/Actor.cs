using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Actor : Entity
{
    protected AbilityManager m_AbilityManager;

    public virtual void AddAbility()
    {
        m_AbilityManager.AddAbility<AnimationAbility>(this);
        m_AbilityManager.AddAbility<SoundAbility>(this);
    }

    public override void Initialize()
    {
        base.Initialize();
        m_AbilityManager = new AbilityManager();
        AddAbility();
        m_AbilityManager.Initialize();
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
