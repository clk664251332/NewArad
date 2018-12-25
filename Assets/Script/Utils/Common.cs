using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Common
{
    public static T GetOrAddComponent<T>(GameObject go) where T : Component
    {
        T t = go.GetComponent<T>();

        if (t == null)
            t = go.AddComponent<T>();

        return t;
    }
}
