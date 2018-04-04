using UnityEngine;
using UnityEngine.Events;

namespace Moments
{
    public class OnRenderImageEvent : UnityEvent<RenderTexture, RenderTexture>
    {
    }

    public class RenderImageProxy : MonoBehaviour
    {
        public readonly OnRenderImageEvent Callback = new OnRenderImageEvent();

        private void OnRenderImage(RenderTexture source, RenderTexture destination)
        {
            Callback.Invoke(source, destination);
        }
    }
}