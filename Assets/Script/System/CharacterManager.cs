using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CharacterManager : SingletonObject<CharacterManager>
{
    protected List<Actor> m_lstCharacterList = new List<Actor>();

    public  void Initialize()
    {
        //角色的添加暂时先在这里
        CreateActor<Hero>("玩家");
        CreateActor<Monster>("怪物");
    }

    public Actor CreateActor<T>(string name) where T : Actor, new()
    {
        Actor actor = new T();
        actor.Name = name;
        m_lstCharacterList.Add(actor);
        actor.Initialize();
        return actor;
    }

    public  void Update()
    {
        for (int i = 0; i < m_lstCharacterList.Count; i++)
        {
            m_lstCharacterList[i].Update();
        }
    }

    public void Release()
    {
        for (int i = 0; i < m_lstCharacterList.Count; i++)
        {
            m_lstCharacterList[i].Release();
        }

        m_lstCharacterList.Clear();
    }
}
