using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public abstract class BaseBattleState : BaseState
{
    protected float m_fAttackMoveSpeed = 0;
    protected float m_fAttackMoveTime = 0;

    public BaseBattleState(Actor actor, EActionState eState) : base(actor, eState)
    {
    }

    public override void EnterState(EActionState eState)
    {
        base.EnterState(eState);

        m_fAttackMoveSpeed = 0;
        m_fAttackMoveTime = 0;

        m_owner.CanMove = false;
        m_owner.CanJump = false;
        m_owner.CanAttack = false;
        m_owner.CanSkill = false;

        m_inputAbility.MoveX(0);
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
    public override void OnFixedUpdate()
    {
        base.OnFixedUpdate();
        if(m_fAttackMoveSpeed!=0&& m_fAttackMoveTime != 0)
        {
            m_fAttackMoveSpeed = Mathf.Lerp(m_fAttackMoveSpeed, 0, m_fAttackMoveTime);
            m_inputAbility.MoveX(m_fAttackMoveSpeed);
        }
    }

    public override void Release()
    {
        base.Release();
    }
}
