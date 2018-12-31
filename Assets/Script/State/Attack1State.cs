using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Attack1State : BaseBattleState
{
    public Attack1State(Actor actor) : base(actor, EActionState.Attack1)
    {
    }

    public override void EnterState(EActionState eState)
    {
        base.EnterState(eState);

        tk2DSpriteAnimator.Play("Attack1");
    }

    public override void BreakState(EActionState eState)
    {
        base.BreakState(eState);
    }

    public override void OnUpdate()
    {
        base.OnUpdate();
        if(tk2DSpriteAnimator.CurrentFrame>=4 && Input.GetKeyDown(KeyCode.X))
        {
            m_stateManager.EnterState(EActionState.Attack2);
        }
    }

    public override void OnAnimationComplete(tk2dSpriteAnimator animator, tk2dSpriteAnimationClip animationClip)
    {
        if (animationClip.name == "Attack1")
        {
            m_stateManager.EnterState(EActionState.Idle);
        }
    }
}
