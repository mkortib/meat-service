$(function() {

    // burger

    $('.main_header_itms .mnu_button').click(function () {
        $(this).find('.hamburger');
        $('.mob_mnu_wr').fadeIn();
        $('.mob_mnu_wr').addClass('mob_mnu_wr_open');

        if ($('.mob_mnu_wr').hasClass('mob_mnu_wr_open')) {
            anime({
                targets: '.mob_mnu_wr_open li, .mnu_footer, .call_link_col_mob',
                translateY: [50, 0],
                opacity: [0, 1],
                easing: "easeOutQuad",
                duration: 1000,
                delay: function(el, i) {
                    return 100 + 70 * i;
                }
            });
        }
    });

    $('.main_mob_itms .mnu_button').click(function () {
        $(this).find('.hamburger');
        $('.mob_mnu_wr').fadeOut();
        $('.mob_mnu_wr').removeClass('mob_mnu_wr_open');
    });

    // home halves

    if ($(window).width() > 768) {

        $('#stop_separator').viewportChecker({
            offset: 0,
            repeat: true,
            callbackFunction: function (elem, action) {

                var height = $('.scroll_img_block').outerHeight() - $('.scroll_bl').outerHeight();

                if (action == 'add') {
                    $('.scroll_img_block').css('position', 'absolute');
                    $('.scroll_img_block').css('top', height);
                } else {
                    $('.scroll_img_block').css('position', 'fixed');
                    $('.scroll_img_block').css('top', 0);
                }
            }
        });

    }

    // scroll home header

    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            $('.main_header_home').addClass('scroll_header');
        } else {
            $('.main_header_home').removeClass('scroll_header');
        }
    });


    $('.popup-with-zoom-anim').magnificPopup({
        type: 'inline',

        fixedContentPos: false,
        fixedBgPos: true,

        overflowY: 'auto',

        closeBtnInside: true,
        preloader: false,

        midClick: true,
        removalDelay: 300,
        mainClass: 'my-mfp-zoom-in'
    });

    $('.gallery_wr').slick({
        dots: false,
        infinite: false,
        speed: 500,
        slidesToShow: 1,
        slidesToScroll: 1,
        fade: true,
        cssEase: 'linear',
        prevArrow: '.gallery_nav .nav_left',
        nextArrow: '.gallery_nav .nav_right'
    });

    // $('.partners_itms').slick({
    //     prevArrow: '.partners_nav .nav_left',
    //     nextArrow: '.partners_nav .nav_right',
    //     // arrows: false,
    //     dots: false,
    //     infinite: false,
    //     speed: 500,
    //     slidesToShow: 4,
    //     slidesToScroll: 1
    // });

    $('.scroll_img_slider').slick({
        // arrows: false,
        dots: false,
        arrows: false,
        infinite: false,
        speed: 2000,
        slidesToShow: 1,
        slidesToScroll: 1,
        fade: true,
        autoplay: true,
        autoplaySpeed: 3000
    });

    $('.partners_itms').on('setPosition', function () {
        $(this).find('.slick-slide').height('auto');
        var slickTrack = $(this).find('.slick-track');
        var slickTrackHeight = $(slickTrack).height();
        $(this).find('.slick-slide').css('height', slickTrackHeight + 'px');
    });

        function truncate(el) {

            el.text(function(i, text) {

                if (text.length >= 700) {
                    text = text.substring(0, 700);
                    var lastIndex = text.lastIndexOf(" ");       // позиция последнего пробела
                    text = text.substring(0, lastIndex) + '...'; // обрезаем до последнего слова
                }

                $(this).text(text);

            });
        }

        var seoWr = $('.seo_wr');
        var seoHtml = $('.seo_wr').html();

        truncate(seoWr);

        $('.seo_button').click(function() {
            if (seoWr.hasClass('seo_close')) {
                seoWr.removeClass('seo_close');
                $(this).find('.more').addClass('hide_seo');
                $(this).find('.less').removeClass('hide_seo');
                $(this).find('svg').css('transform', 'rotate(90deg)');
                seoWr.html(seoHtml);
            } else {
                seoWr.addClass('seo_close');
                $(this).find('.less').addClass('hide_seo');
                $(this).find('svg').css('transform', 'rotate(-90deg)');
                $(this).find('.more').removeClass('hide_seo');
                truncate(seoWr);
            }
        });


    //  Anime,js init


    anime.timeline({loop: false})
        .add({
            targets: '.ml13',
            translateY: [100,0],
            translateZ: 0,
            opacity: [0,1],
            easing: "easeOutExpo",
            duration: 3000,
            delay: function(el, i) {
                return 300 + 30 * i;
            }
        })

        anime({
            targets: '.ml14',
            translateY: [50, 0],
            translateZ: 0,
            opacity: [0, 1],
            easing: "linear",
            duration: 1000,
            delay: 1000
        });

    anime({
        targets: '.scroll_img_slider ',
        translateX: [-100, 0],
        translateZ: 0,
        opacity: [0, 1],
        easing: "easeOutQuad",
        duration: 1500
    })


    $('.s_main_prod').viewportChecker({
        offset: '30%',
        callbackFunction: function (elem, action) {

            if (action == 'add') {

                anime({
                    targets: '.sect_side_bg_left',
                    marginLeft: [-250, 0],
                    opacity: [0, 1],
                    easing: "easeOutQuad",
                    duration: 2000
                });

                anime({
                    targets: '.main_prod_txt',
                    translateX: [250, 0],
                    opacity: [0, 1],
                    easing: "easeOutQuad",
                    duration: 1500
                });

            }

        }

    });

    $('.s_get_price').viewportChecker({
        offset: '30%',
        callbackFunction: function (elem, action) {

            if (action == 'add') {

                anime({
                    targets: '.sect_side_bg_right',
                    marginRight: [-250, 0],
                    opacity: [0, 1],
                    easing: "easeOutQuad",
                    duration: 2000
                });

                anime({
                    targets: '.form_get_price',
                    translateX: [-100, 0],
                    opacity: [0, 1],
                    easing: "easeOutQuad",
                    duration: 1000
                });

            }

        }

    });

    // inputs

    $('form :submit').on('click', function () {
        $('input:required').each(function () {
            if (!$(this).val()) $(this).addClass('incomplete');
        });
    });

    $('input:required').on('input', function () {
        $(this).removeClass('incomplete');
    });

    $('input[name=phone]').mask("+38 (999) 999-9999", {
        completed: function () {
            $(this).removeClass('incomplete');
        }
    });

    $('input[name=name]').on('input', function () {
        $(this).val($(this).val().replace(/[0-9\\/^$.|?*+\-_()]/g, ""));
    });





    // Mobile Menu




    // new fullpage('.scroll_bl', {
    //     sectionsColor: ['yellow', 'orange', '#C0C0C0', '#ADD8E6'],
    // });

    // smooth scroll

    // var options = {
    //     damping: 0.01,
    //     thumbMinSize: 5,
    //     renderByPixel: true,
    //     alwaysShowTracks: false,
    //     continuousScrolling: true
    // };
    //
    // var Scrollbar = window.Scrollbar;
    //
    // Scrollbar.init(document.querySelector('.scroll_bl'), options);




    // waves canvas

        const setWaves = function() {

            const canvas = document.getElementById('waves');
            const canvas2 = document.getElementById('waves2');
            const canvas3 = document.getElementById('waves3');


            /*
             * UTILITIES
             */

            const times = function(amount, closure) {
                let i = 0;
                while (i < amount) {
                    closure(i);
                    i++;
                }
            };

            const func = name =>
                obj => obj[name]()
            ;

            const rand = (min, max) => min + ((max - min) * Math.random());

            const bezier = function(points, context) {
                let a = undefined;
                let b = undefined;
                let x = undefined;
                let y = undefined;
                let i = 1;
                const length = points.length - 2;
                while (i < length) {
                    a = points[i];
                    b = points[i + 1];
                    x = (a.x + b.x) * 0.5;
                    y = (a.y + b.y) * 0.5;
                    context.quadraticCurveTo(a.x, a.y, x, y);
                    i++;
                }
                a = points[i];
                b = points[i + 1];
                context.quadraticCurveTo(a.x, a.y, b.x, b.y);
            };

            const distance = function(a, b) {
                const x = b.x - (a.x);
                const y = b.y - (a.y);
                return Math.sqrt((x * x) + (y * y));
            };

            const clamp = function(val, min, max) {
                if (val < min) { return min; } else if (val > max) { return max; } else { return val; }
            };

            if (!$(canvas).length) {
                return;
            }
            const size = {
                width: window.innerWidth,
                height: window.innerHeight
            };

            /*
             * CONFIG
             */

            const options = {
                color: '#d9dbd9',
                waveAmplitude: 20,
                waveRadius: 200,
                waveElasticity: 0.95,
                waveStrength: 0.011,
                waveMouse: 40,
                waveMax: 200,
                waveComeUp() {},
                waveRiseSpeed: 1,
                lineWidth: 1,
                waveLength: 100,
                distance: 30
            };

            /*
             * GLOBAL CLASSES
             */

            const Mouse = (function() {
                const exports = {
                    x: 0,
                    y: 0,
                    bind(canvas) {
                        canvas.addEventListener('mousemove', onMouseMove);
                        canvas.addEventListener('touchmove', onTouchMove);
                    },
                    unbind(canvas) {
                        canvas.removeEventListener('mousemove', onMouseMove);
                        canvas.removeEventListener('touchmove', onTouchMove);
                    }
                };

                var onMouseMove = function(event) {
                    exports.x = event.pageX - window.scrollX;
                    exports.y = event.pageY - window.scrollY;
                };

                var onTouchMove = function(event) {
                    exports.x = event.touches[0].pageX;
                    exports.y = event.touches[0].pageY;
                };

                return exports;
            })();
            const Mouse2 = (function() {
                const exports = {
                    x: 0,
                    y: 0,
                    bind(canvas2) {
                        canvas2.addEventListener('mousemove', onMouseMove);
                        canvas2.addEventListener('touchmove', onTouchMove);
                    },
                    unbind(canvas2) {
                        canvas2.removeEventListener('mousemove', onMouseMove);
                        canvas2.removeEventListener('touchmove', onTouchMove);``
                    }
                };

                var onMouseMove = function(event) {
                    exports.x = event.pageX - window.scrollX;
                    exports.y = event.pageY - window.scrollY;
                };

                var onTouchMove = function(event) {
                    exports.x = event.touches[0].pageX;
                    exports.y = event.touches[0].pageY;
                };

                return exports;
            })();
            var Stage = {
                width: 1,
                height: 1,
                set(values) {
                    Stage.width = values.width;
                    Stage.height = values.height;
                }
            };

            /*
             * ARCHITECTURE CLASSES
             */

            const Water = function(context) {
                let waves = undefined;

                const init = function() {
                    options.waveComeUp = this.start.bind(this);
                };

                const createWaves = function(height) {
                    let distance;
                    waves = [];
                    ({ distance } = options);
                    times(height / distance, function(index) {
                        waves.push(new Wave(0, (index * distance) + 10, context, rand(0.08, 0.12) * index));
                    });
                };

                this.render = function() {
                    context.strokeStyle = options.color;
                    context.lineWidth = options.lineWidth;
                    context.lineCap = 'round';
                    context.beginPath();
                    waves.forEach(func('render'));
                    context.stroke();
                };

                this.setSize = function(width, height) {
                    createWaves(height);
                    waves.forEach(function(wave) {
                        wave.setSize(width, height);
                    });
                };

                this.start = function() {
                    waves.forEach(func('start'));
                };

                init.call(this);
            };

            var Wave = function(originalX, originalY, context, offset) {
                let anchors = undefined;
                let width = undefined;
                let height = undefined;
                let mouseDirection = undefined;
                let oldMouse = undefined;
                let x = undefined;
                let y = undefined;

                const init = function() {
                    x = originalX;
                    y = originalY;
                    anchors = [];
                    mouseDirection = {
                        x: 0,
                        y: 0
                    };
                    let anchor = undefined;
                    let current = 0;
                    let start = -options.waveAmplitude;
                    let target = options.waveAmplitude;
                    let delta = offset;
                    const step = 0.4;
                    times(window.innerWidth / options.waveLength, function() {
                        anchor = new Anchor(current, 0, start, target, delta);
                        anchor.setOrigin(current + x, y);
                        anchors.push(anchor);
                        current += 90;
                        delta += step;
                        if (delta > 1) {
                            times(Math.floor(delta), function() {
                                delta--;
                                start *= -1;
                                target *= -1;
                            });
                        }
                    });
                };

                const update = function() {
                    const targetY = Math.min(y, Mouse.y + originalY);
                    // targetX = Math.min(x, Mouse.x + originalX)
                    y += (targetY - y) / options.waveRiseSpeed;
                    // x += (targetX - x) / options.waveRiseSpeed
                    updateMouse();
                    anchors.forEach(function(anchor) {
                        anchor.update(mouseDirection, y);
                        // anchor.update mouseDirection, y, x
                    });
                };

                var updateMouse = function() {
                    if (!oldMouse) {
                        oldMouse = {
                            x: Mouse.x,
                            y: Mouse.y
                        };
                        return;
                    }
                    mouseDirection.x = Mouse.x - (oldMouse.x);
                    mouseDirection.y = Mouse.y - (oldMouse.y);
                    oldMouse = {
                        x: Mouse.x,
                        y: Mouse.y
                    };
                };

                this.render = function() {
                    update();
                    context.save();
                    context.translate(x, y);
                    context.moveTo(anchors[0].x, anchors[0].y);
                    bezier(anchors, context);
                    context.restore();
                };

                this.setSize = function(_width, _height) {
                    width = _width;
                    height = _height;
                    const step = _width / (anchors.length - 1);
                    // stepH = _height / (anchors.length - 1)
                    anchors.forEach(function(anchor, i) {
                        anchor.x = step * i;
                        // anchor.y = stepH * i
                        anchor.setOrigin(anchor.x, y);
                        // anchor.setOrigin anchor.x, anchor.y
                    });
                };

                this.onAmpChange = function() {
                    anchors.forEach(func('onAmpChange'));
                };

                this.start = function() {
                    y = height + 300 + (originalY * 0.4);
                };

                init.call(this);
            };

            var Anchor = function(x, y, start, target, delta) {
                let spring = undefined;
                let motion = undefined;
                let origin = undefined;

                const init = function() {
                    spring = new Spring;
                    motion = new Motion(start, target, delta);
                    origin = {};
                    this.x = x;
                    this.y = y;
                };

                const getMultiplier = function() {
                    const lang = distance(Mouse, origin);
                    const radius = options.waveRadius;
                    if (lang < radius) { return 1 - (lang / radius); } else { return 0; }
                };

                // @update = (mouseDirection, currentY, currentX) ->
                this.update = function(mouseDirection, currentY) {
                    origin.y = currentY;
                    // origin.x = currentX
                    const factor = getMultiplier();
                    const vector = {
                        x: mouseDirection.x * factor * options.waveMouse,
                        y: mouseDirection.y * factor * options.waveMouse
                    };
                    if (factor > 0) {
                        spring.shoot(vector);
                    }
                    spring.update();
                    motion.update();
                    this.y = motion.get() + spring.y;
                    // @x = motion.get() + spring.x
                };

                this.onAmpChange = function() {
                    motion.onAmpChange();
                };

                this.setOrigin = function(x, y) {
                    origin.x = x;
                    origin.y = y;
                };

                init.call(this);
            };

            var Motion = function(start, target, delta) {
                const SPEED = 0.02;
                let half = undefined;
                let upper = undefined;
                let lower = undefined;
                let min = undefined;
                let max = undefined;

                const init = function() {
                    this.onAmpChange();
                };

                this.setRange = function(a, b) {
                    min = a;
                    max = b;
                };

                this.update = function() {
                    delta += SPEED;
                    if (delta > 1) {
                        delta = 0;
                        start = target;
                        target = target < half ? rand(upper, max) : rand(min, lower);
                    }
                };

                this.get = function() {
                    const factor = (Math.cos((1 + delta) * Math.PI) + 1) / 2;
                    return start + (factor * (target - start));
                };

                this.onAmpChange = function() {
                    min = -options.waveAmplitude;
                    max = options.waveAmplitude;
                    half = min + ((max - min) / 2);
                    upper = min + ((max - min) * 0.75);
                    lower = min + ((max - min) * 0.25);
                };

                init.call(this);
            };

            var Spring = function() {
                let px = 0;
                let py = 0;
                let vx = 0;
                let vy = 0;
                let targetX = 0;
                let targetY = 0;
                let timeout = undefined;

                const init = function() {
                    this.x = 0;
                    this.y = 0;
                };

                const cancelOffset = function() {
                    targetX = 0;
                    targetY = 0;
                };

                this.update = function() {
                    vx = targetX - (this.x);
                    vy = targetY - (this.y);
                    px = (px * options.waveElasticity) + (vx * options.waveStrength);
                    py = (py * options.waveElasticity) + (vy * options.waveStrength);
                    this.x += px;
                    this.y += py;
                };

                this.shoot = function(vector) {
                    targetX = clamp(vector.x, -options.waveMax, options.waveMax);
                    targetY = clamp(vector.y, -options.waveMax, options.waveMax);
                    clearTimeout(timeout);
                    timeout = setTimeout(cancelOffset, 100);
                };

                init.call(this);
            };

            const Canvas = function(canvas, size) {
                let context = undefined;
                let width = undefined;
                let height = undefined;
                let animation = undefined;

                const init = function() {
                    context = canvas.getContext('2d');
                    window.canvasCTX = context;
                    setTimeout((function() {
                        Mouse.bind(document);
                    }), 1000);
                    Stage.set(size);
                    animation = new Water(context);
                    this.setSize(size.width, size.height);
                    animation.start();
                    requestAnimationFrame(render);
                };

                var render = function() {
                    context.setTransform(1, 0, 0, 1, 0,
                        context.clearRect(0, 0, width, height));
                    context.save();
                    animation.render();
                    context.restore();
                    requestAnimationFrame(render);
                };

                this.setSize = function(_width, _height) {
                    canvas.width = (Stage.width = (width = _width));
                    canvas.height = (Stage.height = (height = _height));
                    animation.setSize(_width, _height);
                };

                init.call(this);
            };

            const Canvas2 = function(canvas2, size) {
                let context = undefined;
                let width = undefined;
                let height = undefined;
                let animation = undefined;

                const init = function() {
                    context = canvas2.getContext('2d');
                    window.canvasCTX = context;
                    setTimeout((function() {
                        Mouse.bind(document);
                    }), 1000);
                    Stage.set(size);
                    animation = new Water(context);
                    this.setSize(size.width, size.height);
                    animation.start();
                    requestAnimationFrame(render);
                };

                var render = function() {
                    context.setTransform(1, 0, 0, 1, 0,
                        context.clearRect(0, 0, width, height));
                    context.save();
                    animation.render();
                    context.restore();
                    requestAnimationFrame(render);
                };

                this.setSize = function(_width, _height) {
                    canvas.width = (Stage.width = (width = _width));
                    canvas.height = (Stage.height = (height = _height));
                    animation.setSize(_width, _height);
                };

                this.setSize2 = function(_width, _height) {
                    canvas2.width = (Stage.width = (width = _width));
                    canvas2.height = (Stage.height = (height = _height));
                    animation.setSize(_width, _height);
                };

                init.call(this);
            };

            /*
             * START
             */

            const app = new Canvas(canvas, size);
            window.addEventListener('resize', (function() {
                app.setSize(window.innerWidth, window.innerHeight);
            }), false);

            const app2 = new Canvas2(canvas2, size);
            window.addEventListener('resize', (function() {
                app2.setSize(window.innerWidth, window.innerHeight);
            }), false);

            const app3 = new Canvas2(canvas3, size);
            window.addEventListener('resize', (function() {
                app3.setSize(window.innerWidth, window.innerHeight);
            }), false);
        };

        setWaves();

    if ($(window).width() < 768) {

        $('canvas').remove();

    }



//# sourceURL=coffeescript

    // Scroll behaviour

    // var _win = $(window),
    //     _rAF = window.requestAnimationFrame,
    //     _cAF = window.cancelAnimationFrame,
    //     _AF = undefined,
    //     _log = $('.s_halves'),
    //     _scroll_time = 1000,
    //     _isMac = /Mac/i.test(navigator.userAgent),
    //     _scroll_distance = 280;
    //
    // console.log(_isMac);
    //
    // function smoothScroll(){
    //     _win.on('mousewheel DOMMouseScroll', function(e){
    //         e.preventDefault();
    //         // console.log(e);
    //         e = e.originalEvent.wheelDelta / 120 || -e.originalEvent.detail / 3;
    //
    //         e = -parseInt(_scroll_distance * e);
    //         log(e);
    //
    //         scrollToAnimation(_win, _scroll_time, {
    //             distance: e,
    //             ease: 'easeOut'
    //         });
    //     });
    // }
    // !_isMac && smoothScroll();
    //
    // function scrollToAnimation(o, time, opt){
    //     var st = o.scrollTop(),
    //         dis = opt.distance,
    //         start = (new Date()).getTime();
    //
    //     time ? void(0) : time = 500;
    //     _cAF(_AF);
    //     animate();
    //     function animate(){
    //         var  now = (new Date()).getTime(),
    //             elapsed = now - start,
    //             fraction = elapsed / time;
    //
    //         if(fraction < 1){
    //             var final = st + dis*Math.sin(fraction*Math.PI/2);
    //             o.scrollTop(final);
    //             // setTimeout(animate, Math.min(25, time - elapsed));
    //             _AF = _rAF(animate);
    //         }else{
    //             log('Complete Scroll...');
    //         }
    //     }
    //
    // }
    //_rAF(scrollToAnimation);

    // function log(e){
    //     _log.text(e);
    // }




});
