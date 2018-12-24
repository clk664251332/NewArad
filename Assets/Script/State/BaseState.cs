using System.Collections;
using System.Collections.Generic;
using UnityEngine;

//状态分类：站立/走/跑/跳/技能
//有些技能状态可以被其他动作强制打断
public class BaseState
{
    protected Actor m_owner;
    protected EActionState m_eState;
    protected float m_fStartTime = 0;
    protected float m_fActionSpeed = 1.0f;

    public BaseState(Actor actor, EActionState eState)
    {
        m_owner = actor;
        m_eState = eState;
    }

    public virtual void Reset()
    {
        m_fActionSpeed = 1.0f;
    }
    /// <summary>
    /// 
    /// </summary>
    /// <param name="eState">进入新状态后上一个状态</param>
    public virtual void EnterState(EActionState eState)
    {

    }

    public virtual void OnUpdate()
    {

    }
    /// <summary>
    /// 
    /// </summary>
    /// <param name="eState">退出后下一个状态</param>
    public virtual void BreakState(EActionState eState)
    {

    }

    public virtual void Release()
    {

    }

    public EActionState GetState()
    {
        return m_eState;
    }
}
