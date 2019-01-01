using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class JumpFallState : BaseJumpState
{
    public JumpFallState(Actor actor) : base(actor, EActionState.Jump_Fall)
    {

    }

    public override void BreakState(EActionState eState)
    {
        base.BreakState(eState);
        m_fOffset = 0;
    }

    public override void EnterState(EActionState eState)
    {
        base.EnterState(eState);
        tk2DSpriteAnimator.Play("Jump_Fall");
    }

    public override void OnAnimationComplete(tk2dSpriteAnimator animator, tk2dSpriteAnimationClip animationClip)
    {
        base.OnAnimationComplete(animator, animationClip);
    }

    public override void OnFixedUpdate()
    {
        base.OnFixedUpdate();
    }

    public override void OnUpdate()
    {
        base.OnUpdate();
        //到达起始点，则改变状态
        if (m_fOffset <= 0)
        {
            m_fOffset = 0;
            m_stateManager.EnterState(EActionState.Jump_Down);
        } 
    }

    public override void Release()
    {
        base.Release();
    }
}
