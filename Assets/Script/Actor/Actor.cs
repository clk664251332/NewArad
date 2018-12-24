using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Actor : Entity
{
    private Transform m_transform = null;
    private Vector3 m_position = Vector3.zero;
    protected AbilityManager m_AbilityManager;

    public Vector3 Position
    {
        get
        {
            return m_position;
        }

        set
        {
            m_position = value;
        }
    }

    public Transform Transform
    {
        get
        {
            return m_transform;
        }

        set
        {
            m_transform = value;
        }
    }

    protected virtual void InitGameObject()
    {
        GameObject gameObject;

        if (m_transform == null)
        {
            gameObject = new GameObject();
            m_transform = gameObject.transform;
        }
        else
        {
            gameObject = m_transform.gameObject;
            gameObject.SetActive(true);
        }

        gameObject = m_transform.gameObject;
        gameObject.SetActive(true);
        gameObject.transform.position = Position;
        gameObject.name = Name;
    }
    private void InitAbility()
    {
        m_AbilityManager = new AbilityManager();
        AddAbility();
        m_AbilityManager.Initialize();
    }

    public virtual void AddAbility()
    {
        m_AbilityManager.AddAbility<AnimationAbility>(this);
        m_AbilityManager.AddAbility<SoundAbility>(this);
    }

    public override void Initialize()
    {
        base.Initialize();
        InitGameObject();
        InitAbility();
        //根据配置调用ability的功能

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
