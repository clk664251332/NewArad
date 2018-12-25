using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public abstract class BaseMovementState : BaseState
{
    HeroInputAbility m_inputAbility;

    public BaseMovementState(Actor actor, EActionState eState) : base(actor, eState)
    {
    }

    public override void EnterState(EActionState eState)
    {
        base.EnterState(eState);

        if (m_inputAbility == null)
        {
            m_inputAbility = m_owner.GetAbility<HeroInputAbility>();
        }
    }

    public override void OnUpdate()
    {
        base.OnUpdate();

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
