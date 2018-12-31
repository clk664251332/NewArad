using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Attack3State : BaseBattleState
{
    public Attack3State(Actor actor) : base(actor, EActionState.Attack3)
    {
    }

    public override void EnterState(EActionState eState)
    {
        base.EnterState(eState);

        tk2DSpriteAnimator.Play("Attack3");
        m_fAttackMoveSpeed = 300f;
        m_fAttackMoveTime = 0.4f;
    }

    public override void BreakState(EActionState eState)
    {
        base.BreakState(eState);
    }

    public override void OnUpdate()
    {
        base.OnUpdate();
    }

    public override void OnAnimationComplete(tk2dSpriteAnimator animator, tk2dSpriteAnimationClip animationClip)
    {
        if (animationClip.name == "Attack3")
        {
            m_stateManager.EnterState(EActionState.Idle);
        }
    }
}
