using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Game.Config;

public abstract class BaseBattleState : BaseState
{
    protected float m_fAttackMoveSpeed = 0;
    protected float m_fAttackMoveFriction = 0;

    private ProfessionSkillLoader.Data m_professionSkillLoaderData;
    protected SkillLoader.Data m_skillData;

    public BaseBattleState(Actor actor, EActionState eState) : base(actor, eState)
    {
       
    }

    public override void EnterState(EActionState eLastState)
    {
        base.EnterState(eLastState);
        GetSkillData();

        m_fAttackMoveSpeed = m_skillData.MoveSpeed;
        m_fAttackMoveFriction = m_skillData.MoveFriction;

        m_owner.CanMove = false;
        m_owner.CanJump = false;
        m_owner.CanAttack = false;
        m_owner.CanSkill = false;

        m_inputAbility.MoveX(0);

        //播放动画
        m_tk2DSpriteAnimator.Play(m_skillData.ActionName);
    }

    public override void OnUpdate()
    {
        base.OnUpdate();

        //连招检测
        if (m_skillData.NextActionName != "0")
        {
            if (m_tk2DSpriteAnimator.CurrentFrame >= m_skillData.EarlyEndFramIndex && Input.GetKey(KeyCode.X))
            {
                m_stateManager.EnterState(m_skillData.NextActionName);
            }
        }
    }

    public override void BreakState(EActionState eNextState)
    {
        base.BreakState(eNextState);
    }

    public override void Reset()
    {
        base.Reset();
    }
    public override void OnFixedUpdate()
    {
        base.OnFixedUpdate();

        //动作位移
        if (m_fAttackMoveSpeed != 0 && m_fAttackMoveFriction != 0)
        {
            m_fAttackMoveSpeed = Mathf.Lerp(m_fAttackMoveSpeed, 0, Time.deltaTime * m_fAttackMoveFriction);
            m_inputAbility.MoveX(m_fAttackMoveSpeed);
        }
    }

    public override void Release()
    {
        base.Release();
    }

    public override void OnAnimationComplete(tk2dSpriteAnimator animator, tk2dSpriteAnimationClip animationClip)
    {
        base.OnAnimationComplete(animator, animationClip);

        if (animationClip.name == m_skillData.ActionName)
        {
            m_stateManager.EnterState(EActionState.Idle);
        }
    }

    private void GetSkillData()
    {
        if (m_professionSkillLoaderData == null)
            m_professionSkillLoaderData = ConfigManager.Instance.GetData<ProfessionSkillLoader, ProfessionSkillLoader.Data>(m_owner.SkillConfigId);

        uint skillId = 0;
        GetSkillIdByState(m_eState, out skillId);

        if (skillId != 0 && m_skillData == null)
            m_skillData = ConfigManager.Instance.GetData<SkillLoader, SkillLoader.Data>(skillId);
    }

    private void GetSkillIdByState(EActionState eState, out uint skillId)
    {
        if (eState == EActionState.Attack1)
            skillId = m_professionSkillLoaderData.Attack1Id;
        else if (eState == EActionState.Attack2)
            skillId = m_professionSkillLoaderData.Attack2Id;
        else if (eState == EActionState.Attack3)
            skillId = m_professionSkillLoaderData.Attack3Id;
        else if (eState == EActionState.Attack4)
            skillId = m_professionSkillLoaderData.Attack4Id;
        else if (eState == EActionState.Skill1)
            skillId = m_professionSkillLoaderData.Skill1Id;
        else if (eState == EActionState.Skill2)
            skillId = m_professionSkillLoaderData.Skill2Id;
        else if (eState == EActionState.Skill3)
            skillId = m_professionSkillLoaderData.Skill3Id;
        else if (eState == EActionState.Skill4)
            skillId = m_professionSkillLoaderData.Skill4Id;
        else if (eState == EActionState.Skill5)
            skillId = m_professionSkillLoaderData.Skill5Id;
        else if (eState == EActionState.Skill6)
            skillId = m_professionSkillLoaderData.Skill6Id;
        else if (eState == EActionState.Skill7)
            skillId = m_professionSkillLoaderData.Skill7Id;
        else if (eState == EActionState.Skill8)
            skillId = m_professionSkillLoaderData.Skill8Id;
        else if (eState == EActionState.Skill9)
            skillId = m_professionSkillLoaderData.Skill9Id;
        else if (eState == EActionState.RunAttack)
            skillId = m_professionSkillLoaderData.RunAttackId;
        else
            skillId = 0;
    }
}
