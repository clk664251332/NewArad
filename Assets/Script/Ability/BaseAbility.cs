using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BaseAbility
{
    public Actor m_owner;

    public void SetOwner(Actor actor)
    {
        m_owner = actor;
    }

    public virtual void Initialize()
    {

    }

    public virtual void GetComponent() { }

    public virtual void Update()
    {

    }

    public virtual void Release()
    {

    }
}
