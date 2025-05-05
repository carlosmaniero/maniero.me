Return-Path: <carlosmaniero@gmail.com>
Delivered-To: carlos@maniero.me
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	by fr-int-smtpin11.hostinger.io (mx.hostinger.com) with ESMTPS id 4ZrNyD3Gtwz2mXDy
	for <carlos@maniero.me>; Mon, 05 May 2025 01:20:52 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=maniero.me;
	s=hostingermail1; t=1746408052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 dkim-signature; bh=HXm6hOGoiWDTkzu8LOd9nD7T/Kqmm8fk04Oq58ySxGE=;
	b=MlzSvZx78dpUNfxTlKIUTA3gTq2FwQaKgvZzcfS/UmEe8bX4IcFT2kM2pjy9G25ny2xXVh
	1c7BcivoFshIHVUuFxLBJSUjE7TXJgup2p9cJwmtScKZIjqgWrWMJXsEEkWKqBEB28LMhP
	e5eYfz389s00374HcNdkXbFkt5cQJPKUXsQdi0ZQJ5dSS+z/32ImxLTVBBY2wt3xrO8nav
	lODPaNzBJzbDIX7McuyDWWF1hhQ6wrrfqEa2FmYCB3wUpZrHbB5J8lL8OInaEFmxZG7XTl
	S+88l0NG60fe3zwZQINodJXtP63n15hDSJgo/GVISU12UJdaPC67dc33ssRnlQ==
ARC-Seal: i=1; s=hostingermail1; d=maniero.me; t=1746408052; a=rsa-sha256;
	cv=none;
	b=PgLlaxc0ra6JUMXknIXrgibwqqlYRUJ5YNx8TZsre4CuhAylKNEyWx4A77WJOPRBZWlfDc
	i54OmHXtw3Oj4EqoN+Kkr890gL7UU0+jog5XXZMHaD1N5MuP2v6Ocb2TsKjZoqEjepJwtL
	piIZcmfYGaWfAXGiqVghnIsAmICo9gq65aIv5NacZcQ/1HsFqmZeZssH8G0T2a+PaWGoM/
	xrJU80f5DZszD4D6CYwuFmhU1wEr1AaVlGI1kjN2jtqR8xvZIi1ypn8oXJbZp/HyG0JV6W
	Jd9ntVO6oW/CdYuofGgN2lIrjqWWom9P9imLw8rCM/rBzWgo8Tg2AorAqYa9vw==
ARC-Authentication-Results: i=1;
	fr-int-smtpin11.hostinger.io;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=blSqilah;
	spf=pass (fr-int-smtpin11.hostinger.io: domain of carlosmaniero@gmail.com designates 2a00:1450:4864:20::52a as permitted sender) smtp.mailfrom=carlosmaniero@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5e5e63162a0so5980184a12.3
        for <carlos@maniero.me>; Sun, 04 May 2025 18:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746408051; x=1747012851; darn=maniero.me;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HXm6hOGoiWDTkzu8LOd9nD7T/Kqmm8fk04Oq58ySxGE=;
        b=blSqilah+KGCkFmB3oKhb+3mizE+dvFZs/+gV6VjQMwNbbA1q32V4TZuVUtn2czJp0
         p6A00hzzz6g7vkPX53iGSFYDVAQxpP+g/objhdmGVSx4iBKdjnLxq7RHtxV9LMR3+U5g
         tyD8BHxYQZB5aJj0zKXD4n5gCvvBdWY7dn5TUy9UelMYh46x3DO7ZArKqrCPR6NHimZ2
         TiEKTOqc7tIhcNOqPJGZUsViQrEMFvneN5orRBxph93l/o5B1wCNtOCQGzDHTPkn7zll
         0u2IuXZ0VXhSQss/h8togKFCz1/l5XQpB5oXqJoiJIJEJ+G4mS8tVl+FhbTRX4SMnD1y
         b7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746408051; x=1747012851;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HXm6hOGoiWDTkzu8LOd9nD7T/Kqmm8fk04Oq58ySxGE=;
        b=ZdUI87GCCNvG59LlzXK3WsJQTbi8/IxAEhoJ3KktpveMMU30SgItdTmZNWjRWs4xuV
         922J4V7TKLf49NXTldt79xebzJwgOvQG0qCR6oEFkjUSzYD47yEtaT/XyOSbvJZr99bC
         5iG8hGXU8vhoOZSfdDo1zq6YGbKqOEiUYdYk145AW8Ic4Hig89F44Hynhoulbkna6QP/
         7YCP9Ku5lu8shhjYos3je+LbUUULXoCSzdZPg2auGywaK7IUgOHvFPR0XAjLY/wmsgnY
         NrDUFVWGyxZeQ5EBpMEyZMlzH4QPYKdPXTP6QUW+7d6zjK3coGYNJo6VpOv9r0O3Z+h7
         tI4g==
X-Gm-Message-State: AOJu0Yz17AIvoQqNSXSB/rNe4uglPzR7o8wHXm19Qga/Vj1O+/NjU9/Z
	Lbz9DLlBhw8GQKrOnSbM3yszZWUIo4oRdQ1BpWuXAdBfMiEcZNxuTlC/mUbGeUTa3VpVGgrLGrh
	8RX10OPpJ4/LoY8+Buuw1MJBKx4fNNQ==
X-Gm-Gg: ASbGnctm5Nke0QZoUvCgZrYsUnrC7BB5vFFS49K72vpztX16MIQ5btvKspeBnDZUHoe
	4q0ML6k++Q9OSGYO3v9GHYiglGH5RuIaCps1Kv/hySbceDTznc+hOe4xclqz8qQFYhBmJUXkzP4
	39+uLQz/hdaC/+mS/TqrsS
X-Google-Smtp-Source: AGHT+IEi93S3E+4qF+zUc0ZujKZCZQEibe9FUi9CmNCIDDIN3wU6hk7cGPK8xjQLDUdGesMuKJSeWTb8dnMKh5Fhw20=
X-Received: by 2002:a17:906:22db:b0:ad1:8f1b:21b5 with SMTP id
 a640c23a62f3a-ad18f1b2528mr573677166b.36.1746408050651; Sun, 04 May 2025
 18:20:50 -0700 (PDT)
MIME-Version: 1.0
From: Carlos Maniero <carlosmaniero@gmail.com>
Date: Sun, 4 May 2025 22:20:38 -0300
X-Gm-Features: ATxdqUFH54dd7hkZQ6jHRz60UAHJyy-Us26WCF2tQIomdQqTrJ0S6smOjJpM8RQ
Message-ID: <CAF_W6ebCMAvFVvcoqpnb4WNTuv89C10ePDCg970iBUDRnryO=A@mail.gmail.com>
Subject: blogpost: New blog
To: Carlos Maniero <carlos@maniero.me>
Content-Type: text/plain; charset="UTF-8"
X-CM-Analysis: v=2.4 cv=Vv1xAP2n c=1 sm=1 tr=0 ts=68181274 a=I2/ymj3agjSCzJf6OxfMBg==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=x7bEGLp0ZPQA:10 a=hLGZJBIvmpkA:10 a=95EFz5htlIgA:10 a=EwCylcuRrSpWm6ZqSZMA:9 a=QEXdDO2ut3YA:10 a=Uz9EnhuHEG25YKoRyM-d:22 a=jMROYaktyPko46j5XlsI:22
X-CM-Envelope: MS4xfNM1jr79G6GixZwCgnZVeU5MgrZasK8JLGvG5u1M9QHWvhxa9FO/sVrLfBnbcbDLUonNjYBvoI7Qq8wnIeOnB4KcLwBIGMOz8iEw0q8CLa3Tso+PyYEa rPcb0FdORO6D2bVuT/0SllzU8CqvduGZLjbpfoo2H5HHdjjFwUVbdxlTB8HvPk9tl8NutCVWj+Sx23XDyEo48ejvewE8edIpuXwN44IilWyxmY1Ft6qr6H46

The ultimate test to ensure everything is working.
