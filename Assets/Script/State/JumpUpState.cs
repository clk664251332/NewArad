using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class JumpUpState : BaseJumpState
{
    public JumpUpState(Actor actor) : base(actor, EActionState.Jump_Up)
    {

    }

    public override void BreakState(EActionState eState)
    {
        base.BreakState(eState);
    }

    public override void EnterState(EActionState eState)
    {
        base.EnterState(eState);

        V0 = 10f;
        m_fOffset = 0;
        m_bStartUp = true;
        tk2DSpriteAnimator.Play("Jump_Up");
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

        if (V0 < 0)
            m_stateManager.EnterState(EActionState.Jump_Fall);
    }

    public override void Release()
    {
        base.Release();
    }
}
