using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StateManager
{
    private Actor m_owner;
    private BaseState m_currState;
    private List<BaseState> m_lstState = new List<BaseState>();

    public StateManager(Actor actor)
    {
        m_owner = actor;

        m_lstState.Add(new IdleState(actor));
        m_lstState.Add(new JumpState(actor));
        m_lstState.Add(new RunState(actor));
        m_lstState.Add(new WalkState(actor));
        m_lstState.Add(new SkillState(actor));
    }

    public void EnterState(EActionState eState)
    {
        if(m_currState != null)
        {
            if (m_currState.GetState() == eState)
                return;
        }
        
        EActionState eLastState = EActionState.None;

        if (m_currState != null)
        {
            eLastState = m_currState.GetState();
            m_currState.BreakState(eState);
        }

        for (int i = 0; i < m_lstState.Count; ++i)
        {
            if (m_lstState[i].GetState() == eState)
            {
                m_currState = m_lstState[i];
                m_lstState[i].EnterState(eLastState);
            }
        }
    }

    public BaseState GetState(EActionState eState)
    {
        for (int i = 0; i < m_lstState.Count; ++i)
        {
            if (m_lstState[i].GetState() == eState)
            {
                return m_lstState[i];
            }
        }

        return null;
    }

    public EActionState GetCurrActionState()
    {
        if (null == m_currState)
            return EActionState.None;

        return m_currState.GetState();
    }

    public BaseState GetCurrState()
    {
        return m_currState;
    }

    public void Update()
    {
        if (m_currState != null)
            m_currState.OnUpdate();
    }

    public void Release()
    {
        if (m_currState != null)
            m_currState.BreakState(EActionState.None);

        Reset();

        foreach (var stateItem in m_lstState)
        {
            stateItem.Release();
        }

        m_currState = null;
    }

    public void Reset()
    {
        for (int i = 0; i < m_lstState.Count; ++i)
        {
            m_lstState[i].Reset();
        }
    }
}
