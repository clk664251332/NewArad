using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Hero : Actor
{
    protected StateManager m_stateMgr;
    //protected BuffManager m_buffMgr;
    //protected SkillManager m_skillMgr;
    private bool m_bIsRun = false;

    public bool IsRun
    {
        get
        {
            return m_bIsRun;
        }

        set
        {
            m_bIsRun = value;
        }
    }

    public Hero() : base()
    {
        m_stateMgr = new StateManager(this as Actor);
    }

    public override void AddAbility()
    {
        base.AddAbility();
        m_AbilityManager.AddAbility<HeroInputAbility>(this);
    }

    public override void Initialize()
    {
        base.Initialize();
        m_stateMgr.EnterState(EActionState.Idle);
    }

    public override void Update()
    {
        base.Update();
        m_stateMgr.Update();
    }

    public override void FixedUpdate()
    {
        base.FixedUpdate();
        m_stateMgr.FixedUpdate();
    }

    public override void Release()
    {
        base.Release();
    }

    public StateManager GetStateMgr()
    {
        return m_stateMgr;
    }

    public StateManager GetStateManager()
    {
        return m_stateMgr;
    }
}
