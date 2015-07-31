/*
' Copyright (c) 2015  sprep.org
'  All rights reserved.
' 
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
' TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
' THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
' CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
' DEALINGS IN THE SOFTWARE.
' 
*/

using System;
using System.Collections;
using DotNetNuke.Entities.Modules;
using Sprep.Soo.Dnn.SessionWarning.Components;
using Sprep.Soo.Dnn.SessionWarning.Components.Sprep.Soo.DNN.PDPModule.Components;

namespace Sprep.Soo.Dnn.SessionWarning {
    public class SessionWarningModuleBase : PortalModuleBase{

        public const int DefaultTimeoutInMinutes = 5;

        public int SessionTimeout {
            get {
                return Page.Session.Timeout;
            }
        }
        public int WarningTimeoutInMinutes {
            get
            {
                ModuleSettings set = new ModuleSettings(PortalId, ModuleId);
                return set.WarningTimeoutInMinutes;
            }
        }
    }
}