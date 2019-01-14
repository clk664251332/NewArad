using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Game.Config;

public class SkillEffect
{
    private SkillEffectLoader.Data m_skillEffectData;
    private tk2dSprite m_tk2DSprite;
    private GameObject m_effectObj;
    private Actor m_owner;
    private Rigidbody2D m_rig2d;
    private float m_createTime;
    private tk2dSpriteAnimator m_tk2DSpriteAnimator;

    private Vector2 m_startPosOffset;
    public SkillEffect(uint id, Actor owner)
    {
        m_owner = owner;
        m_skillEffectData = ConfigManager.Instance.GetData<SkillEffectLoader, SkillEffectLoader.Data>(id);
        m_startPosOffset = ConfigManager.Instance.GetLoader<SkillEffectLoader>().GetStartPosOffset(id);
        if (m_skillEffectData != null)
            Initialize();
    }

    public void Initialize()
    {
        if (m_effectObj == null)
        {
            GameObject loadEffectObj = Resources.Load<GameObject>("Animator/" + m_skillEffectData.PrefabName);
            m_effectObj = Object.Instantiate(loadEffectObj, (Vector2)m_owner.Transform.position + m_startPosOffset, Quaternion.identity);
        }
        if (m_tk2DSpriteAnimator == null)
        {
            m_tk2DSpriteAnimator = Common.GetOrAddComponent<tk2dSpriteAnimator>(m_effectObj);
        }
        if (m_tk2DSprite == null)
        {
            m_tk2DSprite = Common.GetOrAddComponent<tk2dSprite>(m_effectObj);
        }
        if (m_rig2d == null)
        {
            m_rig2d = Common.GetOrAddComponent<Rigidbody2D>(m_effectObj);
            m_rig2d.gravityScale = 0;
            m_rig2d.bodyType = RigidbodyType2D.Kinematic;
        }

        m_effectObj.SetActive(true);
        m_effectObj.transform.position = m_owner.Transform.position;
        m_tk2DSprite.FlipX = m_owner.Direction == 1 ? false : true;
        m_tk2DSpriteAnimator.Play(m_skillEffectData.AnimationName);
        m_rig2d.velocity = new Vector2(m_owner.Direction * m_skillEffectData.Speed, 0);
        m_createTime = Time.time;
    }

    public void Update()
    {
        m_tk2DSprite.SortingOrder = 600 - (int)m_effectObj.transform.position.y + 4;
        if (m_skillEffectData.LifeTime != 0 && Time.time - m_createTime > m_skillEffectData.LifeTime)
            m_effectObj.SetActive(false);
    }

    public void Release()
    {

    }
}
