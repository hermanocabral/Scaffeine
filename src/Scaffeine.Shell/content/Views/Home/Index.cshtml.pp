@using $rootnamespace$.Core.Configuration
@{
    ViewBag.Title = Site.Instance.WebsiteName;
}
@section hero{
    <div class="container showcase">
        <div id="carousel-features" class="carousel slide">
            <div class="carousel-inner" style="height: 413px">
                <div class=" active item">
                    <div style="text-align: center">
                        <h1>
                            Never write the same code twice...</h1>                        
                        <img width="940" height="250" src="@Url.Content("~/content/images/scaffr.png")"/>
                        <br/>
                        <h2>Powershell + NuGet + T4 + Visual Studio</h2>
                    </div>
                </div>                
            </div>
        </div>
        <a class="carousel-control left" href="#carousel-features" data-slide="prev">&lsaquo;</a>
        <a class="carousel-control right" href="#carousel-features" data-slide="next">&rsaquo;</a>
    </div>
}

<div class="container">
    <div class="row">
        <div class="span6">
            <div class="row">
                <div class="span1">
                    <img src="@Url.Content("~/content/images/icon-square.png")"/>
                </div>
                <div class="span5">
                    <h2>
                        .NET Scaffolding Framework
                    </h2>
                    <p>
                        ScaffR is a new framework designed to solve real-world problems that everyday developers face.
                    </p>
                </div>
            </div>
        </div>
        <div class="span6">
            <div class="row">
                <div class="span1">
                    <img src="@Url.Content("~/content/images/icon-square.png")"/>
                </div>
                <div class="span5">
                    <h2>
                        Improve Speed, Cost, and Quality</h2>
                    <p>
                        ScaffR allows both teams and individual programmers to improve quality and speed.
                    </p>
                </div>
            </div>
        </div>
    </div>
    <hr />
    <div class="row">
        <div class="span6">
            <div class="row">
                <div class="span1">
                    <img src="@Url.Content("~/content/images/icon-square.png")"/>
                </div>
                <div class="span5">
                    <h2>
                        NuGet Packages
                    </h2>
                    <p>
                        Use this as the baseline for all your new projects. You will be able to take advantage
                        of all the infrastructure that has been already developed and that will be developed.
                    </p>
                </div>
            </div>
        </div>
       
        <div class="span6">
            <div class="row">
                <div class="span1">
                    <img src="@Url.Content("~/content/images/icon-square.png")"/>
                </div>
                <div class="span5">
                    <h2>
                        Easy to use</h2>
                    <p>
                        Use this as the baseline for all your new projects. You will be able to take advantage
                        of all the infrastructure that has been already developed and that will be developed.
                    </p>
                </div>
            </div>
        </div>
       
    </div>
    <hr/>
    <div class="row">
        <div class="span6">
            <div class="row">
                <div class="span1">
                    <img src="@Url.Content("~/content/images/icon-square.png")"/>
                </div>
                <div class="span5">
                    <h2>
                        Professional Starter Template
                    </h2>
                    <p>
                        Use this as the baseline for all your new projects. You will be able to take advantage
                        of all the infrastructure that has been already developed and that will be developed.
                    </p>
                </div>
            </div>
        </div>
        <div class="span6">
            <div class="row">
                <div class="span1">
                    <img src="@Url.Content("~/content/images/icon-square.png")"/>
                </div>
                <div class="span5">
                    <h2>
                        Open Source</h2>
                    <p>
                        ScaffR is and will always be Open Source.  There is a set of proprietary modules that we call Scaffeine that are proprietary.
                    </p>
                </div>
            </div>
        </div>
    </div>
    
    <br />
    <br />
    <div class="well feature">
        <h3>
            Do the right thing and sign up</h3>
        <a href="@Url.Action("Register", "Account")">Get Started Today</a>
    </div>
</div>
