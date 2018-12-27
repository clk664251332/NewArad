using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Hero : Actor
{
    protected StateManager m_stateMgr;
    //protected BuffManager m_buffMgr;
    //protected SkillManager m_skillMgr;

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
        m_AbilityManager.GetAbility<AnimationAbility>().CreatSprite("Pic/player");
        m_stateMgr.EnterState(EActionState.Idle);
    }

    public override void Update()
    {
        base.Update();
        m_stateMgr.Update();
    }

    public override void Release()
    {
        base.Release();
    }
}
