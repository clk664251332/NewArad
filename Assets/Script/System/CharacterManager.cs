using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CharacterManager : BaseSystem
{
    protected List<Actor> m_lstCharacterList = null;

    public override void Initialize()
    {
        base.Initialize();
        m_lstCharacterList = new List<Actor>();
    }

    public Actor CreateActor<T>() where T : Actor, new()
    {
        Actor actor = new T();
        m_lstCharacterList.Add(actor);
        return actor;
    }

    public override void Update()
    {
        base.Update();
        for (int i = 0; i < m_lstCharacterList.Count; i++)
        {
            m_lstCharacterList[i].Update();
        }
    }
}
