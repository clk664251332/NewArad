using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WalkState : BaseMovementState
{
    public WalkState(Actor actor) : base(actor, EActionState.Walk)
    {
    }

    public override void EnterState(EActionState eState)
    {
        base.EnterState(eState);
        SingletonObject<Hero>.Instance.IsRun = false;
        tk2DSpriteAnimator.Play("Walk");
    }

    public override void BreakState(EActionState eState)
    {
        base.BreakState(eState);
    }

    public override void OnUpdate()
    {
        base.OnUpdate();
    }
}
