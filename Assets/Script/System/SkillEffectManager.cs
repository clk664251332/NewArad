using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SkillEffectManager : SingletonObject<SkillEffectManager>
{
    private List<SkillEffect> m_lstSkillEffects = new List<SkillEffect>();
    private Dictionary<uint, SkillEffect> m_dicSkillEffects = new Dictionary<uint, SkillEffect>();

    public void CreatSkillEffect(uint id, Actor owner)
    {
        //如果该特效已经存在，就拿出来显示重新用
        if (m_dicSkillEffects.ContainsKey(id))
        {
            SkillEffect getSkillEffect;
            m_dicSkillEffects.TryGetValue(id, out getSkillEffect);
            getSkillEffect.Initialize();
        }
        else
        {
            SkillEffect skillEffect = new SkillEffect(id, owner);
            m_lstSkillEffects.Add(skillEffect);
            m_dicSkillEffects.Add(id, skillEffect);
        }
    }

    public void Update()
    {
        for (int i = 0; i < m_lstSkillEffects.Count; i++)
        {
            m_lstSkillEffects[i].Update();
        }
    }

    public void Release()
    {
        for (int i = 0; i < m_lstSkillEffects.Count; i++)
        {
            m_lstSkillEffects[i].Release();
        }
    }
}
