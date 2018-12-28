using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HeroInputAbility : BaseAbility
{
    private const float m_fClickDeltaTime = 0.1f;

    private float m_fLeftArrowKeyUpTime;
    private float m_fRightArrowKeyUpTime;

    private Rigidbody2D m_rig2d;
    private Vector2 m_velocity = Vector2.zero;
    private float m_speed = 100f;

    public override void Initialize()
    {
        base.Initialize();

        var gameObject = m_owner.GetObject();
        if (gameObject == null) return;

        m_rig2d = Common.GetOrAddComponent<Rigidbody2D>(gameObject);
        m_rig2d.gravityScale = 0;
        m_rig2d.bodyType = RigidbodyType2D.Kinematic;      
    }

    public override void GetComponent()
    {
        base.GetComponent();
    }

    public override void Update()
    {
        base.Update();
        if ((m_owner is Hero) == false)
            return;

        CheckDoubleClick();

        if (m_rig2d != null)
            m_rig2d.velocity = m_velocity;
    }

    //在移动状态中调用，非移动状态不需要检测这些输入
    public void InputLogic()
    {
        float h = Input.GetAxisRaw("Horizontal");
        float v = Input.GetAxisRaw("Vertical");

        m_rig2d.velocity = new Vector2(h * m_speed, v * m_speed);

        if (h > 0)
            m_owner.Direction = 1;
        else if (h < 0)
            m_owner.Direction = -1;

        if (h != 0 || v != 0)
        {
            if ((h > 0 && Time.time - m_fRightArrowKeyUpTime < m_fClickDeltaTime) ||
                (h < 0 && Time.time - m_fLeftArrowKeyUpTime < m_fClickDeltaTime))
            {
                SingletonObject<Hero>.Instance.GetStateMgr().EnterState(EActionState.Run);
                m_speed = 160f;
            }
            else if (!SingletonObject<Hero>.Instance.IsRun)
            {
                SingletonObject<Hero>.Instance.GetStateMgr().EnterState(EActionState.Walk);
                m_speed = 100f;
            } 
        }
        else
            SingletonObject<Hero>.Instance.GetStateMgr().EnterState(EActionState.Idle);
    }

    private void CheckDoubleClick()
    {
        if (Input.GetKeyUp(KeyCode.LeftArrow))
        {
            m_fLeftArrowKeyUpTime = Time.time;
        }

        if (Input.GetKeyUp(KeyCode.RightArrow))
        {
            m_fRightArrowKeyUpTime = Time.time;
        }
    }

    private bool CheckIsArrowKey(KeyCode keyCode)
    {
        if (keyCode == KeyCode.LeftArrow || keyCode == KeyCode.RightArrow || keyCode == KeyCode.UpArrow || keyCode == KeyCode.DownArrow)
            return true;
        else
            return false;
    }
}
