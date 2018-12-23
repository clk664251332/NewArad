using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BaseAbility
{
    public Actor m_owner;

    public BaseAbility(AbilityManager abilityManager, Actor owner)
    {
        abilityManager.AddAbility(this);
        m_owner = owner;
    }

    public virtual void Initialize()
    {

    }

    public virtual void Update()
    {

    }

    public virtual void Release()
    {

    }
}
