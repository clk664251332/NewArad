using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public abstract class BaseMovementState : BaseState
{
    HeroInputAbility m_inputAbility;

    public BaseMovementState(Actor actor, EActionState eState) : base(actor, eState)
    {
        if (m_inputAbility == null)
        {
            m_inputAbility = m_owner.GetAbility<HeroInputAbility>();
        }
    }

    public override void EnterState(EActionState eState)
    {
        base.EnterState(eState);

        //这里先进行预设，后面最好根据配置表在具体的状态中来设置这些状态。
        m_owner.CanMove = true;
        m_owner.CanJump = true;
        m_owner.CanAttack = true;
        m_owner.CanSkill = true;
    }

    public override void OnUpdate()
    {
        base.OnUpdate();
    }

    public override void OnFixedUpdate()
    {
        base.OnFixedUpdate();
        m_inputAbility.InputLogic();
    }

    public override void BreakState(EActionState eState)
    {
        base.BreakState(eState);
    }

    public override void Reset()
    {
        base.Reset();
    }

    public override void Release()
    {
        base.Release();
    }
}
