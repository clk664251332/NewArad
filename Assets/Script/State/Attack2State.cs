using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Attack2State : BaseBattleState
{
    public Attack2State(Actor actor) : base(actor, EActionState.Attack2)
    {
    }

    public override void EnterState(EActionState eState)
    {
        base.EnterState(eState);

        tk2DSpriteAnimator.Play("Attack2");
        m_fAttackMoveSpeed = 200f;
        m_fAttackMoveTime = 0.3f;
    }

    public override void BreakState(EActionState eState)
    {
        base.BreakState(eState);
    }

    public override void OnUpdate()
    {
        base.OnUpdate();
        if (tk2DSpriteAnimator.CurrentFrame >= 4 && Input.GetKeyDown(KeyCode.X))
        {
            m_stateManager.EnterState(EActionState.Attack3);
        }
    }

    public override void OnFixedUpdate()
    {
        base.OnFixedUpdate();
    }

    public override void OnAnimationComplete(tk2dSpriteAnimator animator, tk2dSpriteAnimationClip animationClip)
    {
        if (animationClip.name == "Attack2")
        {
            m_stateManager.EnterState(EActionState.Idle);
        }
    }
}
