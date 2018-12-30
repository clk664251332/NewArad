using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Actor : Entity
{
    private Transform m_transform = null;
    private Vector3 m_position = Vector3.zero;
    protected AbilityManager m_AbilityManager;
    private int m_direction = 1;
    private uint m_partConfigId;

    private bool m_bCanMove;
    private bool m_bCanJump;
    private bool m_bCanAttack;
    private bool m_bCanSkill;

    public bool CanMove
    {
        get
        {
            return m_bCanMove;
        }

        set
        {
            m_bCanMove = value;
        }
    }

    public bool CanJump
    {
        get
        {
            return m_bCanJump;
        }

        set
        {
            m_bCanJump = value;
        }
    }

    public bool CanAttack
    {
        get
        {
            return m_bCanAttack;
        }

        set
        {
            m_bCanAttack = value;
        }
    }

    public bool CanSkill
    {
        get
        {
            return m_bCanSkill;
        }

        set
        {
            m_bCanSkill = value;
        }
    }

    public Actor() : base()
    {
        //对象的创建要放在构造函数中去
        m_AbilityManager = new AbilityManager();
        //Ability对象也在构造函数中创建
        AddAbility();
    }

    public Vector3 Position
    {
        get
        {
            return m_position;
        }

        set
        {
            m_position = value;
        }
    }

    public Transform Transform
    {
        get
        {
            return m_transform;
        }

        set
        {
            m_transform = value;
        }
    }

    public int Direction
    {
        get
        {
            return m_direction;
        }

        set
        {
            m_direction = value;
        }
    }

    public uint PartConfigId
    {
        get
        {
            return m_partConfigId;
        }

        set
        {
            m_partConfigId = value;
        }
    }


    /// <summary>
    /// 在场景中创建游戏对象，并把物体放到合适的位置
    /// </summary>
    protected void InitModel()
    {
        GameObject gameObject;

        if (m_transform == null)
        {
            gameObject = new GameObject();
            m_transform = gameObject.transform;
        }

        gameObject = m_transform.gameObject;
        gameObject.SetActive(true);
        gameObject.transform.position = Position;
        gameObject.name = Name;

        GameObject objGroup = GameObjectGroupHandler.GetActorDetailGroup(GetType());
        if (objGroup != null)
        {
            m_transform.parent = objGroup.transform;
        }
    }

    public virtual void AddAbility()
    {
        m_AbilityManager.AddAbility<AnimationAbility>(this);
        m_AbilityManager.AddAbility<SoundAbility>(this);
    }

    public AbilityManager GetAbilityManager()
    {
        return m_AbilityManager;
    }

    public T GetAbility<T>() where T : BaseAbility
    {
        if (m_AbilityManager != null)
        {
            return m_AbilityManager.GetAbility<T>();
        }

        return null;
    }

    public override void Initialize()
    {
        base.Initialize();
        InitModel();
        //必须先把物体创建出来，ability才能在物体上面创建组件
        m_AbilityManager.Initialize();
        m_AbilityManager.GetComponent();
    }

    public override void Update()
    {
        base.Update();
        m_AbilityManager.Update();
    }

    public override void Release()
    {
        base.Release();
        m_AbilityManager.Release();
    }

    public GameObject GetObject()
    {
        if (m_transform != null)
        {
            return m_transform.gameObject;
        }

        return null;
    }
}
