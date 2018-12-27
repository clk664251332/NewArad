using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public abstract class BaseBattleState : BaseState
{
    public BaseBattleState(Actor actor, EActionState eState) : base(actor, eState)
    {
    }

    public override void EnterState(EActionState eState)
    {
        base.EnterState(eState);

        m_owner.CanMove = false;
        m_owner.CanJump = false;
        m_owner.CanAttack = false;
        m_owner.CanSkill = false;
    }

    public override void OnUpdate()
    {
        base.OnUpdate();
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
